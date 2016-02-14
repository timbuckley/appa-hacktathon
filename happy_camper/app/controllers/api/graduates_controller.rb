class Api::GraduatesController < Api::BaseController

  # params: month, year, bootcamp_location, employed, employment_location
  def index
    @graduates = Graduate.post_bootcamp_work.order(cohort_date: :asc).limit(50)

    render :index
  end

  def show
    @graduate = Graduate.includes(work_histories: :company).find_by_uuid(params[:id])

    render :show
  end

end
