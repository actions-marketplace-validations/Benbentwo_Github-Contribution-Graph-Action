#!/usr/bin/env ruby

require 'github_stats'
require 'matrix'
require 'rasem'

Colors = ['#eeeeee', '#d6e685', '#8cc665', '#44a340', '#1e6823']

stats = Github_Stats.new(ARGV.first)
data = stats.data

data.first.date.wday.times { data.unshift Github_Stats::Datapoint.new(data.first.date.prev_day, -1) }
(6 - data.last.date.wday).times { data << Github_Stats::Datapoint.new(data.last.date.next, -1) }

Grid = Matrix[*data.each_slice(7).to_a.transpose]

chart = Rasem::SVGImage.new(20 * Grid.column_count, 20 * Grid.row_count)

Grid.each_with_index do |point, y, x|
    next if point.score == -1
    chart.rectangle (x*20)+1, (y*20)+1, 18, 18, :fill=>Colors[stats.quartile(point.score)]
end

chart.close

File.open('test.svg', 'w') do |file|
  file << chart.output
end

