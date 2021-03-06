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
                        center = 0.41,
                        length = 0.8
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
                        length = 0.8
                    },
                    horizontal = {
                        center = 0.41,
                        length = 0.8
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
                    app = "Telegram Desktop",
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
                    app = "Telegram Desktop",
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
                    app = "Reminders",
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
                {
                    app = "Reeder",
                    screen = "DELL P2715Q",
                    horizontal = {
                        center = 0.5,
                        length = 0.52
                    },
                    vertical = {
                        center = 0.5,
                        length = 0.8
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
                modifiers = {'ctrl', 'alt'},
                key = 'v'
            },
            cmd = 'dir.open-in',
            args = {'/Users/aermolenko/work/src', 'Visual Studio Code'}
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
                modifiers = {"ctrl", "alt"},
                key = "i"
            },
            cmd = "dir.open-in",
            args = {"/Users/aermolenko/work/src", "IntelliJ IDEA"}
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "x"
            },
            cmd = "apps.toggle",
            args = "Xcode"
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
            cmd = "apps.switching.a-or-b",
            args = {"Safari", "Google Chrome"}
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
            cmd = "apps.toggle",
            args = "Mail"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "t"
            },
            cmd = "apps.toggle.a-or-b",
            args = {"Telegram Desktop", "Messages"}
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
                modifiers = {"ctrl", "alt"},
                key = "h"
            },
            cmd = "dir.open-in",
            args = {"/Users/aermolenko/work/homes", "Finder"}
        },
        {
            shortcut = {
                modifiers = {"ctrl", "alt"},
                key = "p"
            },
            cmd = "dir.open-in",
            args = {"/Users/aermolenko/work/src", "Finder"}
        },
        {
            shortcut = {
                modifiers = {"ctrl", "alt"},
                key = "d"
            },
            cmd = "dir.open-in",
            args = {"/Users/aermolenko/work/dos", "Finder"}
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
            cmd = "apps.toggle",
            args = "Notes"
        },
        {
            shortcut = {
                modifiers = {"cmd", "alt"},
                key = "r"
            },
            cmd = "apps.toggle",
            args = "Reminders"
        },
        {
            shortcut = {
                modifiers = {"cmd"},
                key = "\\"
            },
            cmd = "apps.toggle",
            args = "Terminal"
        },
        {
            shortcut = {
                modifiers = {"alt", "shift"},
                key = "o"
            },
            cmd = "macro.seq",
            args = {
                {
                    modifiers = {"ctrl"},
                    key = "p"
                },
                {
                    modifiers = {"ctrl"},
                    key = "e"
                },
                {
                    modifiers = {},
                    key = "return"
                }
            }
        },
        {
            shortcut = {
                modifiers = {"alt"},
                key = "o"
            },
            cmd = "macro.seq",
            args = {
                {
                    modifiers = {"ctrl"},
                    key = "e"
                },
                {
                    modifiers = {},
                    key = "return"
                }
            }
        }
    }
}
