return {
    'kiennt63/harpoon-files.nvim',
    dependencies = {
        { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
    },
    config = function()
        local harpoon_files_component = require('harpoon_files.component')

        function _G.harpoon_tabline()
            local tabs = ''
            local num_tabs = vim.fn.tabpagenr('$')

            if num_tabs > 1 then
                for i = 1, num_tabs do
                    local is_current = i == vim.fn.tabpagenr()
                    local buflist = vim.fn.tabpagebuflist(i)
                    local winnr = vim.fn.tabpagewinnr(i)
                    local bufnr = buflist[winnr]
                    local bufname = vim.fn.bufname(bufnr)
                    local filename = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'

                    if is_current then
                        tabs = tabs .. '%#TabLineSel#'
                    else
                        tabs = tabs .. '%#TabLine#'
                    end

                    tabs = tabs .. ' ' .. i .. ' ' .. filename .. ' '
                end
                tabs = tabs .. '%#TabLineFill#'
            end

            local harpoon_ok, harpoon_result = pcall(harpoon_files_component.harpoon_files)
            local harpoon_files = harpoon_ok and harpoon_result or ''

            if num_tabs > 1 and harpoon_files ~= '' then
                return tabs .. '%=%#TabLine#' .. harpoon_files
            elseif num_tabs > 1 then
                return tabs
            else
                return harpoon_files
            end
        end

        vim.opt.tabline = "%!v:lua.harpoon_tabline()"
    end
}
