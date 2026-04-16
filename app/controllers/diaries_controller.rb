class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
    @index_title = '日記一覧'
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to @diary,notice: '作成しました'
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
    @show_title = '日記詳細'
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy!
    redirect_to diaries_path, notice: '削除しました'
  end

  private

  def diary_params
    params.require(:diary).permit(:body)
  end
end
