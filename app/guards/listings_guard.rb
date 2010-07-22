Ixtlan::Guard.initialize(:listings,
                 { :index => [:listing],
                   :show => [:listing],
                   :edit => [],
                   :update => [],
                   :new => [],
                   :create => [],
                   :destroy => [:listing] })
