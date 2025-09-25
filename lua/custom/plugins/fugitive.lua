return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs', '<cmd>Git<CR>', desc = 'Open Git status' },
    { '<leader>gc', '<cmd>Git commit<CR>', desc = 'Git commit' },
    { '<leader>gp', '<cmd>Git push<CR>', desc = 'Git push' },
    { '<leader>gl', '<cmd>Git pull<CR>', desc = 'Git pull' },
    { '<leader>ga', ':Git add', desc = 'Git add' },
  },
}
