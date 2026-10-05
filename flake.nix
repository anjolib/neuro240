{
  description = "python/jupyter flake for neuro 240";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
  };

  outputs = inputs @ { self, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs { inherit system; };
      python = pkgs.python313;
    in
    {
      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = [
          (python.withPackages (ps: with ps; [
            pip
            jupyter
            jupyterlab-vim
            nbconvert
            ipywidgets

            matplotlib
            numpy
            pandas
            scikit-learn

            jax
            jaxlib
            optax
          ]))
        ];
      };
    };
}
