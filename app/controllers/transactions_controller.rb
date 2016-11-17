class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @tran = Transaction.new
  end

  def create
    @user=current_user
    @tran=@user.transactions.create(transaction_param)
    if @tran.save
      redirect_to user_transactions_path(@user)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @user=User.find(params[:current_user])
    @tran=@user.transactions.find(params[:id])
    @tran.destroy
    redirect_to user_transactions_path
  end

  def edit
  end

  def index
    @user=current_user
    @trans=@user.transactions.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf =PDF::Writer.new
        @trans.each do |tran|
          pdf.text tran.typ
          pdf.text tran.category
          pdf.text tran.amount
          pdf.text tran.date
        end
        send_data pdf.render, filename: 'transaction.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def show
  end

  private
  def transaction_param
    params.require(:transaction).permit(:typ, :category, :amount, :date)
  end

end