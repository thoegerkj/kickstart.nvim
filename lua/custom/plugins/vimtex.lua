return {
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.keymap.set('n', '<leader>lv', ':VimtexView<CR>', { desc = 'Open PDF viewer' })
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_complete_enabled = 1
    vim.api.nvim_create_autocmd('InsertCharPre', {
      pattern = '*.tex',
      callback = function()
        local line = vim.api.nvim_get_current_line()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local col = cursor[2] + 1 -- Current column (1-based index)

        -- Check if we just typed `\begin{`
        if line:sub(col - 7, col) == '\\begin{' then
          vim.defer_fn(function()
            -- Get the environment name (cursor should be inside {})
            local new_line = vim.api.nvim_get_current_line()
            local env = new_line:match '\\begin{(.-)}'
            if env then
              vim.api.nvim_put({ '', '\\end{' .. env .. '}' }, 'l', true, true)
            end
          end, 10) -- Delay to let user finish typing
        end
      end,
    })
  end,
}
