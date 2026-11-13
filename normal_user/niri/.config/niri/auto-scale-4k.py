#!/usr/bin/env python3
"""Keep external outputs running at UHD/DCI 4K scaled to 250%."""

import argparse
import fcntl
import json
import os
from pathlib import Path
import subprocess
import sys
import time


SCALE = 2.5
POLL_SECONDS = 2
FOUR_K_MODES = {(3840, 2160), (4096, 2160)}


def apply_scaling(outputs):
    for name, output in outputs.items():
        # Internal laptop panels use eDP, LVDS, or DSI connectors.
        if name.upper().startswith(("EDP-", "LVDS-", "DSI-")):
            continue
        index = output.get("current_mode")
        logical = output.get("logical")
        if index is None or logical is None:
            continue
        mode = output["modes"][index]
        if (mode["width"], mode["height"]) not in FOUR_K_MODES:
            continue
        if abs(logical["scale"] - SCALE) < 0.001:
            continue
        subprocess.run(
            ["niri", "msg", "output", name, "scale", str(SCALE)],
            check=True,
            timeout=5,
        )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--once", action="store_true", help="apply scaling and exit")
    args = parser.parse_args()
    socket = Path(os.environ["NIRI_SOCKET"])
    # One watcher per compositor session, even when started manually again.
    with socket.with_name(socket.name + ".auto-scale-4k.lock").open("w") as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            return
        while socket.exists():
            try:
                result = subprocess.run(
                    ["niri", "msg", "-j", "outputs"],
                    capture_output=True,
                    text=True,
                    check=True,
                    timeout=5,
                )
                apply_scaling(json.loads(result.stdout))
            except (subprocess.SubprocessError, json.JSONDecodeError) as error:
                print(f"auto-scale-4k: {error}", file=sys.stderr, flush=True)
                if args.once:
                    return 1
            if args.once:
                return 0
            time.sleep(POLL_SECONDS)


if __name__ == "__main__":
    sys.exit(main())
