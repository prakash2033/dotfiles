import pywalQute.draw
from pathlib import Path

config.load_autoconfig(False)

STARTPAGE = Path("~/.config/qutebrowser/startpage.html").expanduser().as_uri()
c.url.default_page = STARTPAGE
c.url.start_pages = STARTPAGE
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.com/s?k={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!dd':      'https://thefreedictionary.com/{}',
    '!e':       'https://www.ebay.com/sch/i.html?_nkw={}',
    '!fb':      'https://www.facebook.com/s.php?q={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gist':    'https://gist.github.com/search?q={}',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!gn':      'https://news.google.com/search?q={}',
    '!ig':      'https://www.instagram.com/explore/tags/{}',
    '!m':       'https://www.google.com/maps/search/{}',
    '!p':       'https://pry.sh/{}',
    '!r':       'https://www.reddit.com/search?q={}',
    '!sd':      'https://slickdeals.net/newsearch.php?q={}&searcharea=deals&searchin=first',
    '!t':       'https://www.thesaurus.com/browse/{}',
    '!tw':      'https://twitter.com/search?q={}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!yelp':    'https://www.yelp.com/search?find_desc={}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

# c.tabs.show = 'multiple'
c.tabs.last_close = 'startpage'
c.scrolling.bar = 'when-searching'
# c.statusbar.show = 'in-mode'

c.colors.webpage.preferred_color_scheme = 'dark'
c.completion.height = '40%'
c.completion.open_categories = ['searchengines', 'bookmarks', 'history', 'quickmarks', 'filesystem']

c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt',
    'https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt',
]

# c.content.pdfjs = True
c.input.mode_override = 'normal'
c.keyhint.delay = 0
# c.content.javascript.clipboard = 'access-paste'
c.downloads.location.prompt = False

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('Z', 'hint links spawn ghostty -e youtube-dl {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')


# TODO:
# rewrite pywalQute and speedcrunch template to only account for qutebrowser
# and to remove cursed variable names

# pywalQute.draw.color(c, {
#     'spacing': {
#         'vertical': 1,
#         'horizontal': 1
#     }
# })
