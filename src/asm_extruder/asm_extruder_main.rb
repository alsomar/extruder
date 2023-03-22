# Please see the loader file for information on the license and author info.
module ASM_Extensions
  module Extruder
    require FILE_DATA
  end # module Extruder

  if !defined?(@asm_tools_menu_loaded)
    @asm_tools_menu = UI.menu("Extensions").add_submenu("ASM Tools")
    @asm_tools_menu_loaded = true
  end

  if !defined?(@extruder_loaded)
    @asm_tools_menu.add_item(Extruder::PLUGIN_NAME) { Extruder.apply_extruder }
    @extruder_loaded = true
  end
end # module ASM_Extensions
