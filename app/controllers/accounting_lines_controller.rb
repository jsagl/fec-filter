class AccountingLinesController < ApplicationController
  def index
    order_mappings = {
      'account_number_asc'  => 'account_number ASC',
      'description_asc' => 'description ASC',
      'mapping_asc' => 'aggregates.name ASC',
      'debit_asc'   => 'debit ASC',
      'credit_asc'  => 'credit ASC',
      'account_number_desc'  => 'account_number DESC',
      'description_desc' => 'description DESC',
      'mapping_desc' => 'aggregates.name DESC',
      'debit_desc'   => 'debit DESC',
      'credit_desc'  => 'credit DESC',
    }

    order = params[:order].present? ? params[:order].split(',').map{|o| order_mappings[o] }.compact.join(', ') : nil

    @accounting_lines = AccountingLine.includes(:aggregate)
    @accounting_lines = @accounting_lines.where('description ILIKE ?', "%#{params[:description]}%") if params[:description].present?
    @accounting_lines = @accounting_lines.where('CAST(account_number AS TEXT) LIKE ?', "%#{params[:account_number]}%") if params[:account_number].present?
    @accounting_lines = order.present? ? @accounting_lines.order(order) : @accounting_lines.order('account_number ASC')
    @accounting_lines = @accounting_lines.limit(params[:limit].present? ? params[:limit]: 10)

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def edit
    @accounting_line = AccountingLine.find(params[:id])
  end

  def update
    @accounting_line = AccountingLine.find(params[:id])
    @accounting_line.update!(description: params[:accounting_line][:description])
  end
end
