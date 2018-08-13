# frozen_string_literal: true

module Orders
  class NewFacade
    delegate :first_lunches, :second_lunches, :drinks,
             to: :menu, allow_nil: true

    def initialize(params)
      @menu_id = params.fetch(:menu_id)
    end

    private

    attr_reader :menu_id

    def menu
      @menu ||= Menu.find_by(id: menu_id)
    end
  end
end
