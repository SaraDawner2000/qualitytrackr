unless Rails.env.production?
  namespace :dev do
    desc "Destroy, create, migrate, and see and populate database with sample data"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "db:seed",
      "dev:sample_data"
      ] do
      puts "Reset environment"
    end

    desc "Add sample_data"
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_parts",
      "dev:add_subcomponents",
      "dev:add_quality_projects"
     ] do
    end

    desc "Add sample users"
    task add_users: :environment do
      User.roles.each do |key, role|
        [false, true].each do |admin_option|
          username = Faker::Internet.username(separators: %w(_))
          User.create(
            email: "#{username}@example.com",
            password: "password",
            username: "#{username}",
            roles: role,
            admin: admin_option
          )
        end
      end

      puts "#{User.count} users created"
    end

    desc "Add sample parts"
    task add_parts: :environment do
      rand(160..300).times do
        part = Part.new
        part.part_number = Faker::Number.number(digits: 8).to_s
        part.revision = ["A", "B", "C", "D", "E"].sample

        if rand < 0.5
          part.job = "N" + Faker::Number.number(digits: 6).to_s
        end

        if rand < 0.5
          part.drawing = "drawing_link"
        end

        if part.job && part.drawing
          if rand < 0.2
            part.base_material = "subcomponent"
          else
            part.base_material = ["steel", "aluminum", nil].sample
          end

          if rand < 0.5
            part.finish = ["paint", "plating"].sample
          end

          if rand < 0.5
            part.measured_status = true
          end
        end

        if part.valid?
          part.save
        end
      end

      puts "#{Part.count} parts created"
    end



    desc "Define random relationships between parts (create sample parts before)"
    task add_subcomponents: :environment do
      Part.top_parts_with_subcomponents.each do |parent|
        if parent.measured_status
          children = Part.single_or_child_parts.where(measured_status: true).sample(rand(1..4))
          children.each do |child|
            Subcomponent.create(
              child_id: child.id,
              parent_id: parent.id
            )
          end
        else
          possible_subcomponents = Part.single_or_child_parts.sample(rand(1..4))
          possible_subcomponents.each do |child|
            Subcomponent.create(
              child_id: child.id,
              parent_id: parent.id
            )
          end
        end
      end

      puts "#{Subcomponent.count} part relationships defined"
    end

    desc "Create sample quality projects (define sample part relationships before)"
    task add_quality_projects: :environment do
      Part.top_parts.each do |part|
        project = QualityProject.new

        project.part_id = part.id

        project.customer = ["sparky", "mctractor"].sample

        if project.customer == "mctractor" && rand < 0.8
          project.customer_request = ["NH", "K", "B", "GI"].sample + Faker::Number.number(digits: 12).to_s
        end

        if project.customer == "sparky"
          project.customer_request = "not_applicable"
        end

        if part.measured?
          project.purchase_order = Faker::Number.number(digits: 5).to_s
          project.inspection_plan = "file_link"

          if rand < 0.6
            project.report_approval = true
          end

        else
          if rand < 0.8
            project.purchase_order = Faker::Number.number(digits: 5).to_s

            if rand < 0.7
              project.inspection_plan = "file_link"
            end
          end
        end


        if project.report_approval && rand < 0.8
          project.assembled_record = "file_link"
        end

        if project.assembled_record && rand < 0.3
          project.record_approval = true
        end

        if project.record_approval && project.customer_request
          project.customer_approval = ["ready", "sent", "approved", "rejected"].sample
        end

        project.save
      end
      puts "#{QualityProject.count} projects created"
    end
  end
end
