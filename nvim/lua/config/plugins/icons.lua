return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").set_icon {
        dart = {
          icon = " ",
          color = "#27A0E9",
          cterm_color = "65",
          name = "Dart",
        },
        ruby = {
          icon = " ",
          color = "#990008",
          cterm_color = "65",
          name = "Ruby",
        },
        gradle = {
          icon = " ",
          color = "#6EA711",
          cterm_color = "65",
          name = "Gradle",
        },
      }

    end,
  },
}
