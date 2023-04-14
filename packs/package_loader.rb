# frozen_string_literal: true

class PackageLoader
  def initialize(packages_folder:)
    @packages_folder = packages_folder
  end

  def list_paths
    [
      Dir["#{@packages_folder}/*"],
      Dir["#{@packages_folder}/*/config/routes"],
      Dir["#{@packages_folder}/*/*"],
      Dir["#{@packages_folder}/*/app/*"]
    ].flatten
  end

  def append_to(collection)
    list_paths.each do |file|
      if File.directory?(file)
        collection << file
      end
    end
  end
end
