{ colors }:

(import ./appearance.nix { inherit colors; }) //
import ./behavior.nix //
import ./binds.nix //
import ./exec-once.nix