module Jekyll

  class ProjectPage < Page
    def initialize(site, base, dir, project)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'project_index.html')
      self.data['project'] = project

      self.data['title'] = "#{project["name"]}ssss"
    end
  end

  class ProjectPageGenerator < Generator
    def generate(site)
      if site.layouts.key? 'project_index'
        dir = site.config['projects_dir'] || 'projects'
        site.config['projects'].keys.each do |project|
          site.pages << ProjectPage.new(site, site.source, File.join(dir, project), site.config['projects'][project])
        end
      end
    end
  end
end
