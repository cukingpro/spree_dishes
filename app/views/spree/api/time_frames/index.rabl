object false
node(:count) { @time_frames.count }
child(@time_frames => :time_frames) do
  extends "spree/api/time_frames/show"
end