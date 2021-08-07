require 'rails_helper'

RSpec.feature 'test', type: :feature, driver: :chrome, js: true, slow: true do
  describe 'Feature spec/工作測試，執行測試用指令：$ rspect spec/features' do
    # before(:each) do
    #   visit new_task_path
    # end

    scenario 'Tasks 新增工作並刪除' do
      visit new_task_path
      expect(Task.count).to eq(0)
    #   click_on('新增工作')
      fill_in('task[name]', with: '吃東西')
      fill_in('task[content]', with: '吃餅乾')
      fill_in('task[end_date]', with: (Time.zone.now+3.days).to_date)
      select("進行中", from: 'task[state]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(1)
      visit task_index_path
      click_on('刪除')
      expect(Task.count).to eq(0)
    end

    scenario 'Tasks 新增工作並編輯' do
      visit new_task_path
      expect(Task.count).to eq(0)
      fill_in('task[name]', with: '追劇')
      fill_in('task[content]', with: '第 69 集')
      fill_in('task[end_date]', with: (Time.zone.now+3.days).to_date)
      select("進行中", from: 'task[state]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(1)

      visit task_index_path
      click_on('編輯')
      fill_in('task[name]', with: '追韓劇')
      fill_in('task[content]', with: '第 70 集')
      fill_in('task[end_date]', with: (Time.zone.now+4.days).to_date)
      select("結束", from: 'task[state]')
      click_button('編輯')
      expect(page).to have_content '工作更新成功。'
      expect(Task.first.name).to eq("追韓劇")
    end

    scenario 'Tasks 新增工作並排序' do
      visit new_task_path
      expect(Task.count).to eq(0)
      fill_in('task[name]', with: '追劇')
      fill_in('task[content]', with: '第 22 集')
      fill_in('task[end_date]', with: (Time.zone.now+2.days).to_date)
      select("進行中", from: 'task[state]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'

      visit new_task_path
      fill_in('task[name]', with: '吃午餐')
      fill_in('task[content]', with: '便當')
      fill_in('task[end_date]', with: (Time.zone.now+1.days).to_date)
      select("結束", from: 'task[state]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(2)

      click_on('最新日期排前')
      expect(page).to have_content("/吃午餐.*追劇/")
      click_on('用ID排前')
      expect(page).to have_content("/追劇.*吃午餐/")
      # expect(page).to have_content 'Success'
    end

    scenario 'Tasks 新增工作並排序' do
      visit new_task_path
      expect(Task.count).to eq(0)
      fill_in('task[name]', with: '追劇')
      fill_in('task[content]', with: '第 22 集')
      fill_in('task[end_date]', with: (Time.zone.now+3.days).to_date)
      select("進行中", from: 'task[state]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'

      visit new_task_path
      fill_in('task[name]', with: '吃午餐')
      fill_in('task[content]', with: '便當')
      fill_in('task[end_date]', with: (Time.zone.now+3.days).to_date)
      select("待處理", from: 'task[state]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(2)

      click_on('最新日期排前')
      expect(page).to have_content("/吃午餐.*追劇/")
      click_on('用ID排前')
      expect(page).to have_content("/追劇.*吃午餐/")
      # expect(page).to have_content 'Success'
    end
    

  end
end