local M = {}
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn

if fn.exists("syntax_on") then
    cmd("syntax reset")
end

local c  -- colors
if o.bg == "dark" then
    c = {
        base02 = "#073642",
        red = "#dc322f",
        green = "#859900",
        yellow = "#b58900",
        blue = "#268bd2",
        magenta = "#d33682",
        cyan = "#2aa198",
        base2 = "#eee8d5",
        base03 = "#002b36",
        back = "#002b36",
        orange = "#cb4b16",
        base01 = "#586e75",
        base00 = "#657b83",
        base0 = "#839496",
        violet = "#6c71c4",
        base1 = "#93a1a1",
        base3 = "#fdf6e3"
    }
else
    c = {
        base2 = "#073642",
        red = "#dc322f",
        green = "#859900",
        yellow = "#b58900",
        blue = "#268bd2",
        magenta = "#d33682",
        cyan = "#2aa198",
        base02 = "#eee8d5",
        base3 = "#002b36",
        orange = "#cb4b16",
        base1 = "#586e75",
        base0 = "#657b83",
        base00 = "#839496",
        violet = "#6c71c4",
        base01 = "#93a1a1",
        base03 = "#fdf6e3",
        back = "#fdf6e3"
    }
end

local settings = {
    solarized_termtrans = false,
    solarized_italics = true
}

for key, val in pairs(settings) do
    if g[key] == nil then
        g[key] = val
    end
end

local setup = function(group, colors)
    if colors.guisp == nil then
        cmd(string.format("highlight! %s guifg=%s guibg=%s gui=%s", group, colors.guifg, colors.guibg, colors.gui))
    else
        cmd(
            string.format(
                "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
                group,
                colors.guifg,
                colors.guibg,
                colors.guisp,
                colors.gui
            )
        )
    end
end

function M.load_syntax()
    local italics = function()
        if g.solarized_italics then
            return "italic"
        else
            return "none"
        end
    end

    local termtrans = function(color)
        if g.solarized_termtrans then
            return "none"
        else
            return color
        end
    end

    local syntax = {}
    syntax["Normal"] = {guifg = c.base0, guibg = termtrans(c.base03), gui = "none"}
    syntax["CursorLine"] = {guifg = "none", guibg = c.base02, gui = "none"}
    syntax["Terminal"] = {guifg = "fg", guibg = termtrans(c.base03), gui = "none"}
    syntax["ToolbarButton"] = {guifg = c.base1, guibg = termtrans(c.base02), gui = "bold"}
    syntax["ToolbarLine"] = {guifg = "none", guibg = termtrans(c.base02), gui = "none"}

    syntax["CursorLineNr"] = {guifg = c.orange, guibg = "bg", gui = "bold"}
    syntax["NonText"] = {guifg = c.orange, guibg = "bg", gui = "bold"}
    syntax["SpecialKey"] = {guifg = "none", guibg = "none", gui = "reverse"}
    syntax["SpellBad"] = {guifg = "none", guibg = "none", guisp = c.red, gui = "undercurl"}
    syntax["SpellCap"] = {guifg = "none", guibg = "none", guisp = c.red, gui = "undercurl"}
    syntax["SpellLocal"] = {guifg = "none", guibg = "none", guisp = c.red, gui = "undercurl"}
    syntax["SpellRare"] = {guifg = "none", guibg = "none", guisp = c.red, gui = "undercurl"}
    syntax["Title"] = {guifg = c.yellow, guibg = "bg", gui = "bold"}

    syntax["DiffAdd"] = {guifg = c.green, guibg = "none", gui = "reverse"}
    syntax["DiffChange"] = {guifg = c.yellow, guibg = "none", gui = "reverse"}
    syntax["DiffDelete"] = {guifg = c.red, guibg = "none", gui = "reverse"}
    syntax["DiffText"] = {guifg = c.blue, guibg = "none", gui = "reverse"}

    syntax["StatusLine"] = {guifg = c.base02, guibg = c.base2, gui = "reverse"}
    syntax["StatusLineNC"] = {guifg = c.base02, guibg = c.base1, gui = "reverse"}
    syntax["TabLineSel"] = {guifg = c.base2, guibg = c.base02, gui = "none"}
    syntax["NormalMode"] = {guifg = c.base02, guibg = c.base2, gui = "reverse"}

    syntax["ColorColumn"] = {guifg = "none", guibg = c.base02, gui = "none"}
    syntax["Conceal"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["CursorColumn"] = {guifg = "none", guibg = c.base02, gui = "none"}
    syntax["Directory"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["EndOfBuffer"] = {guifg = "none", guibg = "none", gui = "none"}
    syntax["ErrorMsg"] = {guifg = c.red, guibg = c.base3, gui = "reverse"}
    syntax["FoldColumn"] = {guifg = c.base0, guibg = "none", gui = "none"}
    syntax["Folded"] = {guifg = c.base0, guibg = "none", guisp = c.base03, gui = "bold"}
    syntax["IncSearch"] = {guifg = c.orange, guibg = "none", gui = "standout"}
    syntax["LineNr"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["MatchParen"] = {guifg = c.base3, guibg = c.base02, gui = "bold"}
    syntax["ModeMsg"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["MoreMsg"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["Pmenu"] = {guifg = c.base0, guibg = c.base02, gui = "none"}
    syntax["PmenuSbar"] = {guifg = "none", guibg = c.base02, gui = "none"}
    syntax["PmenuSel"] = {guifg = c.base2, guibg = c.base01, gui = "none"}
    syntax["PmenuThumb"] = {guifg = "none", guibg = c.base01, gui = "none"}
    syntax["Question"] = {guifg = c.cyan, guibg = "none", gui = "bold"}
    syntax["Search"] = {guifg = c.yellow, guibg = "none", gui = "reverse"}
    syntax["SignColumn"] = {guifg = c.base0, guibg = "none", gui = "none"}
    syntax["TabLine"] = {guifg = c.base01, guibg = c.base02, gui = "none"}
    syntax["TabLineFill"] = {guifg = c.base01, guibg = c.base02, gui = "none"}
    syntax["VertSplit"] = {guifg = c.base01, guibg = c.base02, gui = "none"}
    -- #3c5f96 also a good choice for visual
    syntax["Visual"] = {guifg = "none", guibg = "#494c4d", gui = "none"}
    syntax["VisualNOS"] = {guifg = "none", guibg = c.base02, gui = "reverse"}
    syntax["WarningMsg"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["WildMenu"] = {guifg = c.base00, guibg = c.base2, gui = "reverse"}
    syntax["Comment"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["Constant"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["CursorIM"] = {guifg = "none", guibg = "fg", gui = "none"}
    syntax["Error"] = {guifg = "fg", guibg = "bg", guisp = c.red, gui = "undercurl"}
    syntax["Identifier"] = {guifg = "none", guibg = "none", gui = "none"}
    syntax["Ignore"] = {guifg = "none", guibg = "none", gui = "none"}
    syntax["PreProc"] = {guifg = c.orange, guibg = "bg", gui = "italic"}
    syntax["Special"] = {guifg = c.orange, guibg = "none", gui = "none"}
    syntax["Statement"] = {guifg = c.green, guibg = "none", gui = "none"}
    syntax["Todo"] = {guifg = c.magenta, guibg = "none", gui = "bold"}
    syntax["Type"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["Underlined"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["InsertMode"] = {guifg = c.base02, guibg = c.cyan, gui = "bold,reverse"}
    syntax["ReplaceMode"] = {guifg = c.base02, guibg = c.orange, gui = "bold,reverse"}
    syntax["VisualMode"] = {guifg = c.base02, guibg = c.magenta, gui = "bold,reverse"}
    syntax["CommandMode"] = {guifg = c.base02, guibg = c.magenta, gui = "bold,reverse"}
    syntax["vimCommentString"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["vimCommand"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["vimCmdSep"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["helpExample"] = {guifg = c.base1, guibg = "none", gui = "none"}
    syntax["helpOption"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["helpNote"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["helpVim"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["helpHyperTextJump"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["helpHyperTextEntry"] = {guifg = c.green, guibg = "none", gui = "none"}
    syntax["vimIsCommand"] = {guifg = c.base00, guibg = "none", gui = "none"}
    syntax["vimSynMtchOpt"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["vimSynType"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["vimHiLink"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["vimHiGroup"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["vimGroup"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["gitcommitComment"] = {guifg = c.base01, guibg = "none", gui = italics()}
    syntax["gitcommitUnmerged"] = {guifg = c.green, guibg = "none", gui = "bold"}
    syntax["gitcommitOnBranch"] = {guifg = c.base01, guibg = "none", gui = "bold"}
    syntax["gitcommitBranch"] = {guifg = c.magenta, guibg = "none", gui = "bold"}
    syntax["gitcommitUnmerged"] = {guifg = c.green, guibg = "none", gui = "bold"}
    syntax["gitcommitOnBranch"] = {guifg = c.base01, guibg = "none", gui = "bold"}
    syntax["gitcommitBranch"] = {guifg = c.magenta, guibg = "none", gui = "bold"}
    syntax["gitcommitdiscardedtype"] = {guifg = c.red, guibg = "none", gui = "none"}
    syntax["gitcommitselectedtype"] = {guifg = c.green, guibg = "none", gui = "none"}
    syntax["gitcommitHeader"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["gitcommitUntrackedFile"] = {guifg = c.cyan, guibg = "none", gui = "bold"}
    syntax["gitcommitDiscardedFile"] = {guifg = c.red, guibg = "none", gui = "bold"}
    syntax["gitcommitSelectedFile"] = {guifg = c.green, guibg = "none", gui = "bold"}
    syntax["gitcommitUnmergedFile"] = {guifg = c.yellow, guibg = "none", gui = "bold"}
    syntax["gitcommitFile"] = {guifg = c.base0, guibg = "none", gui = "bold"}
    syntax["htmlTag"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["htmlEndTag"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["htmlTagN"] = {guifg = c.base1, guibg = "none", gui = "bold"}
    syntax["htmlTagName"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["htmlSpecialTagName"] = {guifg = c.blue, guibg = "none", gui = italics()}
    syntax["htmlArg"] = {guifg = c.base00, guibg = "none", gui = "none"}
    syntax["javaScript"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["perlHereDoc"] = {guifg = c.base1, guibg = c.base03, gui = "none"}
    syntax["perlVarPlain"] = {guifg = c.yellow, guibg = c.base03, gui = "none"}
    syntax["perlStatementFileDesc"] = {guifg = c.cyan, guibg = c.base03, gui = "none"}
    syntax["texstatement"] = {guifg = c.cyan, guibg = c.base03, gui = "none"}
    syntax["texmathzonex"] = {guifg = c.yellow, guibg = c.base03, gui = "none"}
    syntax["texmathmatcher"] = {guifg = c.yellow, guibg = c.base03, gui = "none"}
    syntax["texreflabel"] = {guifg = c.yellow, guibg = c.base03, gui = "none"}
    syntax["rubyDefine"] = {guifg = c.base1, guibg = c.base03, gui = "bold"}
    syntax["rubyBoolean"] = {guifg = c.magenta, guibg = c.base03, gui = "none"}
    syntax["cPreCondit"] = {guifg = c.orange, guibg = "none", gui = "none"}
    syntax["VarId"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["ConId"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["hsImport"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["hsString"] = {guifg = c.base00, guibg = "none", gui = "none"}
    syntax["hsStructure"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["hs_hlFunctionName"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["hsStatement"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["hsImportLabel"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["hs_OpFunctionName"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["hs_DeclareFunction"] = {guifg = c.orange, guibg = "none", gui = "none"}
    syntax["hsVarSym"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["hsType"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["hsTypedef"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["hsModuleName"] = {guifg = c.green, guibg = "none", gui = "none"}
    syntax["hsNiceOperator"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["hsniceoperator"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["pandocTitleBlock"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocTitleBlockTitle"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocTitleComment"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocComment"] = {guifg = c.base01, guibg = "none", gui = italics()}
    syntax["pandocVerbatimBlock"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["pandocBlockQuote"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocBlockQuoteLeader1"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocBlockQuoteLeader2"] = {guifg = c.cyan, guibg = "none", gui = "none"}
    syntax["pandocBlockQuoteLeader3"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["pandocBlockQuoteLeader4"] = {guifg = c.red, guibg = "none", gui = "none"}
    syntax["pandocBlockQuoteLeader5"] = {guifg = c.base0, guibg = "none", gui = "none"}
    syntax["pandocBlockQuoteLeader6"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["pandocListMarker"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocListReference"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocDefinitionBlock"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["pandocDefinitionTerm"] = {guifg = c.violet, guibg = "none", gui = "standout"}
    syntax["pandocDefinitionIndctr"] = {guifg = c.violet, guibg = "none", gui = "bold"}
    syntax["pandocEmphasisDefinition"] = {guifg = c.violet, guibg = "none", gui = italics()}
    syntax["pandocEmphasisNestedDefinition"] = {guifg = c.violet, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisDefinition"] = {guifg = c.violet, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisNestedDefinition"] = {guifg = c.violet, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisEmphasisDefinition"] = {guifg = c.violet, guibg = "none", gui = "bold"}
    syntax["pandocStrikeoutDefinition"] = {guifg = c.violet, guibg = "none", gui = "reverse"}
    syntax["pandocVerbatimInlineDefinition"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["pandocSuperscriptDefinition"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["pandocSubscriptDefinition"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["pandocTable"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocTableStructure"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocTableZebraLight"] = {guifg = c.blue, guibg = c.base03, gui = "none"}
    syntax["pandocTableZebraDark"] = {guifg = c.blue, guibg = c.base02, gui = "none"}
    syntax["pandocEmphasisTable"] = {guifg = c.blue, guibg = "none", gui = italics()}
    syntax["pandocEmphasisNestedTable"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisTable"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisNestedTable"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisEmphasisTable"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocStrikeoutTable"] = {guifg = c.blue, guibg = "none", gui = "reverse"}
    syntax["pandocVerbatimInlineTable"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocSuperscriptTable"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocSubscriptTable"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocHeadingMarker"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocEmphasisHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocEmphasisNestedHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisNestedHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisEmphasisHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocStrikeoutHeading"] = {guifg = c.orange, guibg = "none", gui = "reverse"}
    syntax["pandocVerbatimInlineHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocSuperscriptHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocSubscriptHeading"] = {guifg = c.orange, guibg = "none", gui = "bold"}
    syntax["pandocLinkDelim"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["pandocLinkLabel"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocLinkText"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocLinkURL"] = {guifg = c.base00, guibg = "none", gui = "none"}
    syntax["pandocLinkTitle"] = {guifg = c.base00, guibg = "none", gui = "none"}
    syntax["pandocLinkTitleDelim"] = {guifg = c.base01, guibg = "none", guisp = c.base00, gui = "none"}
    syntax["pandocLinkDefinition"] = {guifg = c.cyan, guibg = "none", guisp = c.base00, gui = "none"}
    syntax["pandocLinkDefinitionID"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocImageCaption"] = {guifg = c.violet, guibg = "none", gui = "bold"}
    syntax["pandocFootnoteLink"] = {guifg = c.green, guibg = "none", gui = "none"}
    syntax["pandocFootnoteDefLink"] = {guifg = c.green, guibg = "none", gui = "bold"}
    syntax["pandocFootnoteInline"] = {guifg = c.green, guibg = "none", gui = "bold"}
    syntax["pandocFootnote"] = {guifg = c.green, guibg = "none", gui = "none"}
    syntax["pandocCitationDelim"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocCitation"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocCitationID"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocCitationRef"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocStyleDelim"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["pandocEmphasis"] = {guifg = c.base0, guibg = "none", gui = italics()}
    syntax["pandocEmphasisNested"] = {guifg = c.base0, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasis"] = {guifg = c.base0, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisNested"] = {guifg = c.base0, guibg = "none", gui = "bold"}
    syntax["pandocStrongEmphasisEmphasis"] = {guifg = c.base0, guibg = "none", gui = "bold"}
    syntax["pandocStrikeout"] = {guifg = c.base01, guibg = "none", gui = "reverse"}
    syntax["pandocVerbatimInline"] = {guifg = c.yellow, guibg = "none", gui = "none"}
    syntax["pandocSuperscript"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["pandocSubscript"] = {guifg = c.violet, guibg = "none", gui = "none"}
    syntax["pandocRule"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocRuleLine"] = {guifg = c.blue, guibg = "none", gui = "bold"}
    syntax["pandocEscapePair"] = {guifg = c.red, guibg = "none", gui = "bold"}
    syntax["pandocCitationRef"] = {guifg = c.magenta, guibg = "none", gui = "none"}
    syntax["pandocNonBreakingSpace"] = {guifg = c.red, guibg = "none", gui = "reverse"}
    syntax["pandocMetadataDelim"] = {guifg = c.base01, guibg = "none", gui = "none"}
    syntax["pandocMetadata"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocMetadataKey"] = {guifg = c.blue, guibg = "none", gui = "none"}
    syntax["pandocMetadata"] = {guifg = c.blue, guibg = "none", gui = "bold"}

    syntax["Boolean"] = syntax["Constant"]
    syntax["Character"] = syntax["Constant"]
    syntax["Conditional"] = syntax["Statement"]
    syntax["Debug"] = syntax["Special"]
    syntax["Define"] = syntax["PreProc"]
    syntax["Delimiter"] = syntax["Special"]
    syntax["Exception"] = syntax["Statement"]
    syntax["Float"] = syntax["Constant"]
    syntax["Function"] = syntax["Identifier"]
    syntax["Include"] = syntax["PreProc"]
    syntax["Keyword"] = syntax["Statement"]
    syntax["Label"] = syntax["Statement"]
    syntax["Macro"] = syntax["PreProc"]
    syntax["Number"] = syntax["Constant"]
    syntax["Operator"] = syntax["Statement"]
    syntax["PreCondit"] = syntax["PreProc"]
    syntax["QuickFixLine"] = syntax["Search"]
    syntax["Repeat"] = syntax["Statement"]
    syntax["SpecialChar"] = syntax["Special"]
    syntax["SpecialComment"] = syntax["Special"]
    syntax["StatusLineTerm"] = syntax["StatusLine"]
    syntax["StatusLineTermNC"] = syntax["StatusLineNC"]
    syntax["StorageClass"] = syntax["Type"]
    syntax["String"] = syntax["Constant"]
    syntax["Structure"] = syntax["Type"]
    syntax["Tag"] = syntax["Special"]
    syntax["Typedef"] = syntax["Type"]
    syntax["lCursor"] = syntax["Cursor"]

    syntax["vimVar"] = syntax["Identifier"]
    syntax["vimFunc"] = syntax["Function"]
    syntax["vimUserFunc"] = syntax["Function"]
    syntax["helpSpecial"] = syntax["Special"]
    syntax["vimSet"] = syntax["Normal"]
    syntax["vimSetEqual"] = syntax["Normal"]
    syntax["diffAdded"] = syntax["Statement"]
    syntax["diffLine"] = syntax["Identifier"]
    syntax["gitcommitUntracked"] = syntax["gitcommitComment"]
    syntax["gitcommitDiscarded"] = syntax["gitcommitComment"]
    syntax["gitcommitSelected"] = syntax["gitcommitComment"]
    syntax["gitcommitNoBranch"] = syntax["gitcommitBranch"]
    syntax["gitcommitDiscardedArrow"] = syntax["gitcommitDiscardedFile"]
    syntax["gitcommitSelectedArrow"] = syntax["gitcommitSelectedFile"]
    syntax["gitcommitUnmergedArrow"] = syntax["gitcommitUnmergedFile"]
    syntax["jsFuncCall"] = syntax["Function"]
    syntax["rubySymbol"] = syntax["Type"]
    syntax["hsImportParams"] = syntax["Delimiter"]
    syntax["hsDelimTypeExport"] = syntax["Delimiter"]
    syntax["hsModuleStartLabel"] = syntax["hsStructure"]
    syntax["hsModuleWhereLabel"] = syntax["hsModuleStartLabel"]
    syntax["pandocVerbatimBlockDeep"] = syntax["pandocVerbatimBlock"]
    syntax["pandocCodeBlock"] = syntax["pandocVerbatimBlock"]
    syntax["pandocCodeBlockDelim"] = syntax["pandocVerbatimBlock"]
    syntax["pandocTableStructureTop"] = syntax["pandocTableStructre"]
    syntax["pandocTableStructureEnd"] = syntax["pandocTableStructre"]
    syntax["pandocEscapedCharacter"] = syntax["pandocEscapePair"]
    syntax["pandocLineBreak"] = syntax["pandocEscapePair"]
    syntax["pandocMetadataTitle"] = syntax["pandocMetadata"]

    -- TreeSitter
    -- syntax['TSAnnotation'] = syntax['']
    syntax["TSBoolean"] = syntax["Constant"]
    syntax["TSCharacter"] = syntax["Constant"]
    syntax["TSComment"] = syntax["Comment"]
    syntax["TSConditional"] = syntax["Conditional"]
    syntax["TSConstant"] = syntax["Constant"]
    syntax["TSConstBuiltin"] = syntax["Constant"]
    syntax["TSConstMacro"] = syntax["Constant"]
    syntax["TSError"] = syntax["Error"]
    syntax["TSException"] = syntax["Exception"]
    syntax["TSField"] = syntax["Identifier"]
    syntax["TSFloat"] = syntax["Float"]
    syntax["TSFunction"] = syntax["Function"]
    syntax["TSFuncBuiltin"] = syntax["Function"]
    syntax["TSFuncMacro"] = syntax["Function"]
    syntax["TSInclude"] = syntax["Include"]
    syntax["TSKeyword"] = syntax["Keyword"]
    syntax["TSLabel"] = syntax["Label"]
    syntax["TSMethod"] = syntax["Function"]
    syntax["TSNamespace"] = syntax["Identifier"]
    syntax["TSNumber"] = syntax["Constant"]
    syntax["TSOperator"] = syntax["Operator"]
    syntax["TSParameterReference"] = syntax["Identifier"]
    syntax["TSProperty"] = syntax["TSField"]
    syntax["TSPunctDelimiter"] = syntax["Delimiter"]
    syntax["TSPunctBracket"] = syntax["Delimiter"]
    syntax["TSPunctSpecial"] = syntax["Special"]
    syntax["TSRepeat"] = syntax["Repeat"]
    syntax["TSString"] = syntax["Constant"]
    syntax["TSStringRegex"] = syntax["Constant"]
    syntax["TSStringEscape"] = syntax["Constant"]
    syntax["TSStrong"] = {guifg = c.base1, guibg = c.base03, gui = "bold"}
    syntax["TSConstructor"] = syntax["Function"]
    syntax["TSKeywordFunction"] = syntax["Identifier"]
    syntax["TSLiteral"] = syntax["Normal"]
    syntax["TSParameter"] = syntax["Identifier"]
    syntax["TSVariable"] = syntax["Identifier"]
    syntax["TSVariableBuiltin"] = syntax["Identifier"]
    syntax["TSTag"] = syntax["Special"]
    syntax["TSTagDelimiter"] = syntax["Delimiter"]
    syntax["TSTitle"] = syntax["Title"]
    syntax["TSType"] = syntax["Type"]
    syntax["TSTypeBuiltin"] = syntax["Type"]
    -- syntax['TSEmphasis'] = syntax['']

    syntax["LspDiagnosticsDefaultInformation"] = { guifg = "none", guibg = "none", guisp = c.cyan, gui = "none" }
    syntax["LspDiagnosticsDefaultHint"] = { guifg = "none", guibg = "none", guisp = c.green, gui = "none" }
    syntax["LspDiagnosticsDefaultWarning"] = { guifg = "none", guibg = "none", guisp = c.yellow, gui = "none" }
    syntax["LspDiagnosticsDefaultError"] = {guifg = "none", guibg = "none", guisp = c.red, gui = "none"}

    syntax["LspDiagnosticsUnderlineInformation"] ={ guifg = "none", guibg = "none", guisp = c.cyan, gui = "undercurl" }
    syntax["LspDiagnosticsUnderlineHint"] = { guifg = "none", guibg = "none", guisp = c.green, gui = "undercurl" }
    syntax["LspDiagnosticsUnderlineWarning"] ={ guifg = "none", guibg = "none", guisp = c.yellow, gui = "undercurl" }
    syntax["LspDiagnosticsUnderlineError"] ={guifg = "none", guibg = "none", guisp = c.red, gui = "undercurl"}

    syntax["LspSagaFinderSelection"] = syntax["Search"]
    syntax["DiagnosticError"] = syntax["LspDiagnosticsDefaultError"]
    syntax["DiagnosticWarning"] = syntax["LspDiagnosticsDefaultWarning"]
    syntax["DiagnosticInformation"] = syntax["LspDiagnosticsDefaultInformation"]
    syntax["DiagnosticHint"] = syntax["LspDiagnosticsDefaultHint"]
    syntax["TargetWord"] = syntax["Title"]

    syntax["HlSearchLensCur"] = syntax["Comment"]
    syntax["HlSearchLens"] = syntax["Comment"]
    syntax["HlSearchCur"] = syntax["IncSearch"]

    -- TODO fix these
    syntax["LspReference"] = {gui = "standout", guifg = "fg", guibg = "bg"}
    syntax["LspReferenceRead"] = {gui = "standout", guifg = "fg", guibg = "bg"}
    syntax["LspReferenceText"] = {gui = "standout", guifg = "fg", guibg = "bg"}
    syntax["LspReferenceWrite"] = {gui = "standout", guifg = "fg", guibg = "bg"}

    -- TODO fix these
    syntax["TSDefinitionUsage"] = {guifg = "none", guibg = "none", guisp = c.base01, gui = "underline"}
    syntax["TSDefinition"] = {guifg = "none", guibg = "none", guisp = c.base01, gui = "bold,underline"}
    syntax["TSCurrentScope"] = {guifg = "none", guibg = "none", guisp = c.base01, gui = "underline"}

    for group, colors in pairs(syntax) do
        setup(group, colors)
    end
end

M.load_syntax()
