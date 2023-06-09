require 'extensions' unless defined?(SketchupExtension)

module ASM_Extensions
  module Extruder

    # Variables
    PLUGIN_NAME = 'Extruder'.freeze
    PLUGIN_VERSION = '1.0.0'.freeze
    PLUGIN_DESCRIPTION = 'Extrude several 2D groups at once.'.freeze
    PLUGIN_AUTHOR = 'Alejandro Soriano'.freeze
    PLUGIN_ID = File.basename(__FILE__, '.rb')

    # Folders
    PATH_ROOT = File.dirname(__FILE__)
    FILE_DATA = File.join(PATH_ROOT, PLUGIN_ID, PLUGIN_ID+"_data.rb")
    FILE_MAIN = File.join(PATH_ROOT, PLUGIN_ID, PLUGIN_ID+"_main.rb")

    # Create a new instance of the SketchupExtension class
    EXT_DATA = SketchupExtension.new(PLUGIN_NAME, FILE_MAIN)

    # Attach some nice info
    EXT_DATA.creator = PLUGIN_AUTHOR
    EXT_DATA.version = PLUGIN_VERSION
    EXT_DATA.copyright = "2022-#{Time.now.year}, #{PLUGIN_AUTHOR}"
    EXT_DATA.description = PLUGIN_DESCRIPTION

    # Register and load the extension on first install
    Sketchup.register_extension(EXT_DATA, true)

  end # module Extruder
end # module ASM_Extensions
