class SeedProjectsAndTodos < ActiveRecord::Migration[6.1]
  def change
    data = YAML.load(File.read('./seeds.yml'))

    data['projects'].each do |p|
      project = Project.create!(title: p['title'])

      p['todos'].each do |t|
        Todo.create!(
          text: t['text'],
          is_completed: t['is_completed'],
          project_id: project.id
        )
      end
    end
  end
end
