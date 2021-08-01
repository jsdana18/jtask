require 'rails_helper'

RSpec.feature 'test', type: :feature, driver: :chrome, js: true, slow: true do
  describe 'Feature spec/工作測試，執行測試用指令：$ rspect spec/features' do
    # before(:each) do
    #   visit new_task_path
    # end

    scenario 'Tasks 新增工作' do
      visit new_task_path
      expect(Task.count).to eq(0)
    #   click_on('新增工作')
      fill_in('task[name]', with: '吃東西')
      fill_in('task[content]', with: '吃餅乾')
      click_button('新增工作')
      expect(Task.count).to eq(1)
      visit task_index_path
      click_on('刪除')
      expect(Task.count).to eq(0)
    end

    # scenario 'Tasks 刪除工作' do
    #   visit task_index_path
    #   expect(Task.count).to eq(1)
    #   click_on('刪除')
    #   # fill_in('task[name]', with: '吃東西')
    #   # fill_in('task[content]', with: '吃餅乾')
    #   # click_button('新增工作')
    #   expect(Task.count).to eq(0)
    # end

  end
end