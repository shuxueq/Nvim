return {
  "nathom/filetype.nvim",
  lazy = true,
  event = "User FileOpened",
  config = function()
    require("filetype").setup({
      overrides = {
        -- set the filetype of *.[key] files to [value]
        extensions = {
          h = "cpp",
          lua = "lua",
        },
        -- set the filetype of files named [key] to [value]
        literal = {
        },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            [".*git/config"] = "gitconfig", -- Included in the plugin
        },

        -- The same as the ones above except the keys map to functions
        function_extensions = {
            ["cpp"] = function()
                vim.bo.filetype = "cpp"
                -- Remove annoying indent jumping
                vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
            end,
            ["pdf"] = function()
                vim.bo.filetype = "pdf"
                -- Open in PDF viewer (Skim.app) automatically
                vim.fn.jobstart(
                    "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
                )
            end,
        },
        function_literal = {
            Brewfile = function()
                vim.cmd("syntax off")
            end,
        },
        function_complex = {
            ["*.math_notes/%w+"] = function()
                vim.cmd("iabbrev $ $$")
            end,
        },
        shebang = {
            -- Set the filetype of files with a dash shebang to sh
            dash = "sh",
        },
      },
    })
  end,
}
