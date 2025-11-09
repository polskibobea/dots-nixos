{
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.languages.nix = {
      extraDiagnostics.types = [ "statix" "deadnix" ];
      format.enable = true;
      treesitter.enable = true;
      lsp = {
      enable = true;
      server = "nixd";
      };
    };
  };
};
}
