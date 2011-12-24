module AccountsHelper
  def account_link(account)
    link_to account.name, account_things_path(account)
  end
end
