module ASM_Extensions
  module Extruder

    def self.apply_extruder
      selected_groups = Sketchup.active_model.selection.to_a.grep(Sketchup::Group)

      default_extrusion_height = 10

      prompts = ["Extrusion Height: "]
      defaults = [default_extrusion_height]
      input = UI.inputbox(prompts, defaults, "Extruder")

      extrusion_height_value = input[0] || default_extrusion_height

      model = Sketchup.active_model
      units_options = model.options["UnitsOptions"]
      length_unit = units_options["LengthUnit"]

      conversion_factor = case length_unit
                          when 0 # inches
                            1.0
                          when 1 # feet
                            12.0
                          when 2 # millimeters
                            0.0393701
                          when 3 # centimeters
                            0.393701
                          when 4 # meters
                            39.3701
                          end

      extrusion_height = extrusion_height_value * conversion_factor

      model.start_operation("Extrude Faces", true)

      selected_groups.each do |group|
        face = group.entities.grep(Sketchup::Face).first
        next unless face

        face.pushpull(extrusion_height)
      end

      model.commit_operation
      Sketchup.active_model.active_view.invalidate
    end

  end
end
