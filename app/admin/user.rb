ActiveAdmin.register User do
	
	#config.batch_actions = true
	#actions :index, :show, :destroy

	filter :email
	filter :created_at
	filter :updated_at

	scope :all, :default => true
	scope :confirmed
	scope :unconfirmed

	index :download_links => [:csv] do |users|
		selectable_column
		id_column
		column :email
		column :created_at
		column :updated_at
		column :confirmed_at

		default_actions
	end

	show do |user|
		attributes_table do
			row :id
			row :email
			row :created_at
			row :updated_at
			row :sign_in_count
			row :current_sign_in_at
			row :last_sign_in_at
			row :current_sign_in_ip
			row :last_sign_in_ip
			row :confirmed_at
			row :confirmation_sent_at
			row :unconfirmed_email
			row :reset_password_sent_at			
		end
		active_admin_comments
	end

	form do |f|
		f.inputs "User Details" do
			f.input :email
			f.input :password
			f.input :password_confirmation
		end
		f.buttons
	end

	csv do
		column :id
		column :email
		column :created_at
		column :confirmed_at
	end
end
