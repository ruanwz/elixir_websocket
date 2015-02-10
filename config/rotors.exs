use Rotor.Config
import CoffeeRotor

# paths = ["web/**/*", "lib/**/*"]
# 
# Rotor.define :ex_modules, paths, fn(changed, _all)->
#   reload_modules(changed)
# end

paths = ["assets/libs/*.coffee", "assets/*.coffee"]
Rotor.define :coffee_assets, paths, fn(changed_files, all_files)->
  read_files(all_files)
  |> coffee
  |> concat
  |> output_to("priv/static/js/app.js")
end
