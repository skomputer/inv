module AccountsHelper
  def account_link(account)
    link_to account.username, account_path(account)
  end
end
