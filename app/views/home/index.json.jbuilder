json.adverts  Ad.where(status: Settings.ACTIVE_STATUSES.active).includes(:account, :ad_campaign, :ad_set).order("updated_at desc").limit(5) do |ad|
  json.ad ad
  json.account do
    json.(ad.account, *ad.account.class.column_names)
    json.profile ad.account.profile
  end
  json.ad_campaign ad.ad_campaign
  json.ad_set ad.ad_set
end
json.root_url root_url
