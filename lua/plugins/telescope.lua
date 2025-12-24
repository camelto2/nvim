return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- build step for the fzf C extension
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release "
            .. "&& cmake --build build --config Release "
            .. "&& cmake --install build --prefix build",
        -- alternatively: build = "make"
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup{
        defaults = {
          path_display = { "shorten" },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- enable fuzzy matching
            override_generic_sorter = true,  -- replace generic sorter
            override_file_sorter    = true,  -- replace file sorter
            case_mode = "smart_case",        -- or "ignore_case" / "respect_case"
          },
        },
      }
      -- load the fzf extension
      telescope.load_extension("fzf")

      -- helper: find the git root of the current buffer (or cwd)
      local function find_git_root()
        local cwd = vim.fn.getcwd()
        local bufname = vim.api.nvim_buf_get_name(0)
        local dir = bufname == "" and cwd or vim.fn.fnamemodify(bufname, ":h")
        local git_root = vim.fn.systemlist(
          "git -C " .. vim.fn.escape(dir, " ") .. " rev-parse --show-toplevel"
        )[1]
        if vim.v.shell_error ~= 0 then
          vim.notify("Not a git repo, defaulting to cwd", vim.log.levels.WARN)
          return cwd
        end
        return git_root
      end

      -- custom live_grep that always runs from the git root
      local function live_grep_git_root()
        require("telescope.builtin").live_grep{
          search_dirs = { find_git_root() },
        }
      end

      -- expose a :LiveGrepGitRoot command
      vim.api.nvim_create_user_command(
        "LiveGrepGitRoot",
        live_grep_git_root,
        {}
      )

      -- keymaps
      local map = vim.keymap.set
      local builtin = require("telescope.builtin")
      local themes  = require("telescope.themes")

      map("n", "<leader>?",   builtin.oldfiles,  { desc = "[?] Find recently opened files" })
      map("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
      map("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(
          themes.get_dropdown{ winblend = 10, previewer = false }
        )
      end, { desc = "[/] Fuzzily search in current buffer" })

      map("n", "<leader>sf", builtin.find_files,   { desc = "[S]earch [F]iles" })
      map("n", "<leader>sh", builtin.help_tags,    { desc = "[S]earch [H]elp" })
      map("n", "<leader>sw", builtin.grep_string,  { desc = "[S]earch current [W]ord" })
      map("n", "<leader>sg", builtin.live_grep,    { desc = "[S]earch by [G]rep" })
      map("n", "<leader>sG", "<cmd>LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
      map("n", "<leader>sd", builtin.diagnostics,  { desc = "[S]earch [D]iagnostics" })
      map("n", "<leader>sr", builtin.resume,       { desc = "[S]earch [R]esume" })
      map("n", "<leader>sk", builtin.keymaps,      { desc = "[S]earch [K]eymaps" })
    end,
  }
