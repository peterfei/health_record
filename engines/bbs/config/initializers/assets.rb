Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
Rails.application.config.assets.precompile += %w( admin-lte/dist/img/user2-160x160.jpg admin-lte/dist/img/boxed-bg.jpg admin-lte/dist/img/user4-128x128.jpg)