return {
    windows = {
        tolerance = 10,
        layout = {
            default = {
                vertical = {
                    center = 0.5,
                    length = 0.644
                },
                horizontal = {
                    center = 0.5,
                    length = 0.5
                },
                left = {
                    position = 0,
                    length = 0.2267
                },
                right = {
                    position = 0,
                    length = 0.2267
                },
                grow = {
                    step = 0.05
                }
            },
            screens = {
                {
                    screen = "Color LCD",
                    vertical = {
                        center = 0.5,
                        length = 0.9
                    },
                    horizontal = {
                        center = 0.5,
                        length = 0.7
                    },
                    left = {
                        position = 0,
                        length = 0.2267
                    },
                    right = {
                        position = 0,
                        length = 0.1
                    },
                    grow = {
                        step = 0.05
                    }
                },
                {
                    screen = "DELL P2715Q",
                    vertical = {
                        center = 0.5,
                        length = 0.644
                    },
                    horizontal = {
                        center = 0.509,
                        length = 0.692
                    },
                    left = {
                        position = 0,
                        length = 0.152
                    },
                    right = {
                        position = 0,
                        length = 0.1
                    },
                    grow = {
                        step = 0.05
                    }
                }
            },
            apps = {
                {
                    app = "Telegram",
                    screen = "Color LCD",
                    horizontal = {
                        center = 0.5,
                        length = 0.45
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.644
                    }
                },
                {
                    app = "Telegram",
                    screen = "DELL P2715Q",
                    horizontal = {
                        center = 0.5,
                        length = 0.35
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.55
                    }
                },
                {
                    app = "Cantata",
                    screen = "Color LCD",
                    horizontal = {
                        center = 0.5,
                        length = 0.45
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.644
                    }
                },
                {
                    app = "Cantata",
                    screen = "DELL P2715Q",
                    horizontal = {
                        center = 0.5,
                        length = 0.35
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.55
                    }
                },
                {
                    app = "Messages",
                    screen = "Color LCD",
                    horizontal = {
                        center = 0.5,
                        length = 0.45
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.644
                    }
                },
                {
                    app = "Messages",
                    screen = "DELL P2715Q",
                    horizontal = {
                        center = 0.5,
                        length = 0.35
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.55
                    }
                },
                {
                    app = "Finder",
                    screen = "Color LCD",
                    horizontal = {
                        center = 0.5,
                        length = 0.45
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.644
                    }
                },
                {
                    app = "Finder",
                    screen = "DELL P2715Q",
                    horizontal = {
                        center = 0.5,
                        length = 0.35
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.55
                    }
                },
            }
        }
    },
    keys = {
        {
            shortcut = {
                modifiers = {"cmd", "alt", "ctrl"},
                key = "k"
            },
            cmd = "wnd.tall",
            args = {}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt", "ctrl"},
                key = "j"
            },
            cmd = "wnd.cntr",
            args = {}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt", "ctrl"},
                key = "h"
            },
            cmd = "wnd.left",
            args = {}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt", "ctrl"},
                key = "l"
            },
            cmd = "wnd.right",
            args = {}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt", "ctrl"},
                key = "f"
            },
            cmd = "wnd.growh",
            args = {}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt", "ctrl"},
                key = "b"
            },
            cmd = "wnd.shrinkh",
            args = {}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "v"
            },
            cmd = "apps.toggle-altname",
            args = {"Visual Studio Code", "Code"}
        },
        {
            shortcut = {
                modifiers = {'cmd'},
                key = '\\'
            },
            cmd = 'cde.src',
            args = '/Users/aermolenko/work/src'
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "i"
            },
            cmd = "apps.toggle",
            args = "IntelliJ IDEA"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "s"
            },
            cmd = "apps.toggle",
            args = "Slack"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "c"
            },
            cmd = "apps.launchOrFocus",
            args = "Calendar"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "b"
            },
            cmd = "apps.toggle",
            args = "Safari"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "c"
            },
            cmd = "apps.launchOrFocus",
            args = "Calendar"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "m"
            },
            cmd = "apps.launchOrFocus",
            args = "Mail"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "t"
            },
            cmd = "apps.toggle.a-or-b",
            args = {"Telegram", "Messages"}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "f"
            },
            cmd = "apps.launchOrFocus",
            args = "Finder"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "u"
            },
            cmd = "apps.toggle",
            args = "iTunes"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "n"
            },
            cmd = "apps.launchOrFocus",
            args = "Notes"
        },
        {
            shortcut = {
                modifiers = {"alt"},
                key = "`"
            },
            cmd = "apps.toggle",
            args = "Terminal"
        }
    }
}
