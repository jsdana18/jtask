require 'rails_helper'

RSpec.feature 'test', type: :feature, driver: :chrome, js: true, slow: true do
  describe 'Feature spec/工作測試，執行測試用指令：$ rspect spec/features' do
    before(:each) do
      visit new_task_path
      expect(Task.count).to eq(0)
      fill_in('task[name]', with: '追日劇')
      fill_in('task[content]', with: '第 22 集')
      fill_in('task[end_date]', with: (Time.zone.now+5.days).to_date)
      select("進行中", from: 'task[state]')
      select("低", from: 'task[priority]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(1)

      visit new_task_path
      fill_in('task[name]', with: '追韓劇')
      fill_in('task[content]', with: '神話第 25 集')
      fill_in('task[end_date]', with: (Time.zone.now+2.days).to_date)
      select("待處理", from: 'task[state]')
      select("中", from: 'task[priority]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(2)

      visit new_task_path
      fill_in('task[name]', with: '吃午餐')
      fill_in('task[content]', with: '深夜食堂')
      fill_in('task[end_date]', with: (Time.zone.now+6.days).to_date)
      select("進行中", from: 'task[state]')
      select("高", from: 'task[priority]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(3)

      visit new_task_path
      fill_in('task[name]', with: '追美劇')
      fill_in('task[content]', with: '紙牌第 7 集')
      fill_in('task[end_date]', with: (Time.zone.now+1.days).to_date)
      select("待處理", from: 'task[state]')
      select("中", from: 'task[priority]')
      click_button('新增')
      expect(page).to have_content '工作新增成功。'
      expect(Task.count).to eq(4)
    end

    scenario 'Tasks 新增工作並刪除' do
      visit task_index_path
      click_on('刪除', match: :first)
      expect(Task.count).to eq(3)
    end

    scenario 'Tasks 新增工作並編輯' do
      visit task_index_path
      click_on('編輯', match: :first)
      fill_in('task[name]', with: '追美劇')
      fill_in('task[content]', with: '第 70 集')
      fill_in('task[end_date]', with: (Time.zone.now+4.days).to_date)
      select("結束", from: 'task[state]')
      click_button('編輯')
      expect(page).to have_content '工作更新成功。'
      expect(Task.first.name).to eq("追美劇")
      expect(Task.first.state).to eq("done")
    end

    scenario 'Tasks 新增工作並排序' do
      click_on('最新日期排前')
      expect(page).to match /吃午餐.+追日劇.+追韓劇/
      click_on('依 ID 排前')
      expect(page).to match /追日劇.*追韓劇.*吃午餐/m
      click_on('依優先權高排前')
      expect(page).to match /吃午餐.*追韓劇.*追美劇/m
      # expect(page).to have_content 'Success'
    end


    scenario 'Tasks 新增工作並搜尋' do
      visit q_task_index_path
      fill_in('q', with: '劇')
      select("進行中", from: 'state')
      click_button('搜尋工作')
      expect(page).to have_content "追日劇"
      # expect(page).to have_content "/追日劇.*進行中.*吃午餐.*進行中/"
    end
    

  end
end