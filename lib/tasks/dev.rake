desc "Fill the database with sample data"
task sample_data: :environment do
  current = Time.now

  User.delete_all
  QualityProject.delete_all
  Subcomponent.delete_all
  Part.delete_all



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

  rand(160..300).times do
    part = Part.new
    part.part_number = Faker::Number.number(digits: 10).to_s
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

  Part.where(base_material: "subcomponent").each do |parent|
    if parent.measured_status
      possible_subcomponents = Part.top_parts_with_subcomponents.where(measured_status: true).sample(rand(1..4))
      possible_subcomponents.each do |child|
        Subcomponent.create(
          child_id: child.id,
          parent_id: parent.id
        )
      end
    else
      possible_subcomponents = Part.top_parts_with_subcomponents.sample(rand(1..4))
      possible_subcomponents.each do |child|
        Subcomponent.create(
          child_id: child.id,
          parent_id: parent.id
        )
      end
    end
  end

  puts "#{Subcomponent.count} part relationships defined"

  Part.top_parts.each do |part|
    project = QualityProject.new

    project.part_id = part.id

    project.customer = ["CNH", "S&C"].sample

    if project.customer == "CNH" && rand < 0.8
      project.customer_request = ["NH", "K", "B", "GI"].sample + Faker::Number.number(digits: 16).to_s
    end

    if project.customer == "S&C"
      project.customer_request = "not_applicable"
    end

    if rand < 0.8
      project.purchase_order = Faker::Number.number(digits: 5).to_s
    end

    if project.purchase_order && rand < 0.8
      project.inspection_plan = "file_link"
    end

    if project.inspection_plan && rand < 0.5
      project.report_approval = true
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

  puts "sample_data took #{Time.now - current} seconds"
end
