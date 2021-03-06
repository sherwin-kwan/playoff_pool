task :seed_old_results => :environment do
  
  sherwin = User.find(1)
  joey = User.find(2)
  alex = User.find(3)
  billy = User.find(4)
  james = User.find(5)
  ellery = User.find(6)
  omar = User.find(7)
  nathaniel = User.find(8)
  steven = User.find(9)
  vinny = User.find(10)
  jay = User.find(11)
  yuji = User.find(12)

  sherwin.results.create(year: 2012, correct: 5, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 2, points: 9)
  billy.results.create(year: 2012, correct: 10, incorrect: 5, lower_seed_correct: 5, lower_seed_incorrect: 1, points: 10)
  james.results.create(year: 2012, correct: 7, incorrect: 8, lower_seed_correct: 4, lower_seed_incorrect: 3, points: 0)
  ellery.results.create(year: 2012, correct: 4, incorrect: 10, lower_seed_correct: 1, lower_seed_incorrect: 3, points: -1)
  nathaniel.results.create(year: 2012, correct: 6, incorrect: 9, lower_seed_correct: 4, lower_seed_incorrect: 4, points: 11)
  steven.results.create(year: 2012, correct: 6, incorrect: 9, lower_seed_correct: 2, lower_seed_incorrect: 2, points: -1)
  jay.results.create(year: 2012, correct: 8, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 1, points: 16)
  vinny.results.create(year: 2012, correct: 6, incorrect: 9, lower_seed_correct: 2, lower_seed_incorrect: 2, points: 8)

  sherwin.results.create(year: 2013, correct: 13, incorrect: 2, lower_seed_correct: 5, lower_seed_incorrect: 1, points: 26)
  joey.results.create(year: 2013, correct: 9, incorrect: 6, lower_seed_correct: 1, lower_seed_incorrect: 1, points: 25)
  billy.results.create(year: 2013, correct: 11, incorrect: 4, lower_seed_correct: 3, lower_seed_incorrect: 1, points: 23)
  james.results.create(year: 2013, correct: 9, incorrect: 6, lower_seed_correct: 4, lower_seed_incorrect: 4, points: 15)
  ellery.results.create(year: 2013, correct: 7, incorrect: 8, lower_seed_correct: 0, lower_seed_incorrect: 2, points: 18)
  omar.results.create(year: 2013, correct: 9, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 2, points: 27)
  nathaniel.results.create(year: 2013, correct: 9, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 2, points: 24)
  steven.results.create(year: 2013, correct: 10, incorrect: 5, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 25)
  jay.results.create(year: 2013, correct: 6, incorrect: 7, lower_seed_correct: 2, lower_seed_incorrect: 4, points: 8)

  sherwin.results.create(year: 2014, correct: 11, incorrect: 3, lower_seed_correct: 6, lower_seed_incorrect: 0, points: 19)
  joey.results.create(year: 2014, correct: 10, incorrect: 5, lower_seed_correct: 4, lower_seed_incorrect: 0, points: 18)
  alex.results.create(year: 2014, correct: 9, incorrect: 6, lower_seed_correct: 4, lower_seed_incorrect: 1, points: 11)
  billy.results.create(year: 2014, correct: 7, incorrect: 8, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 15)
  james.results.create(year: 2014, correct: 7, incorrect: 8, lower_seed_correct: 4, lower_seed_incorrect: 3, points: 13)
  ellery.results.create(year: 2014, correct: 9, incorrect: 6, lower_seed_correct: 4, lower_seed_incorrect: 1, points: 14)
  omar.results.create(year: 2014, correct: 8, incorrect: 7, lower_seed_correct: 3, lower_seed_incorrect: 1, points: 10)
  nathaniel.results.create(year: 2014, correct: 9, incorrect: 6, lower_seed_correct: 4, lower_seed_incorrect: 1, points: 12)
  steven.results.create(year: 2014, correct: 7, incorrect: 8, lower_seed_correct: 2, lower_seed_incorrect: 1, points: 9)
  jay.results.create(year: 2014, correct: 6, incorrect: 9, lower_seed_correct: 2, lower_seed_incorrect: 2, points: 10)

  sherwin.results.create(year: 2015, correct: 7, incorrect: 7, lower_seed_correct: 3, lower_seed_incorrect: 4, points: 12)
  joey.results.create(year: 2015, correct: 8, incorrect: 7, lower_seed_correct: 4, lower_seed_incorrect: 4, points: 12)
  alex.results.create(year: 2015, correct: 9, incorrect: 6, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 15)
  billy.results.create(year: 2015, correct: 13, incorrect: 2, lower_seed_correct: 6, lower_seed_incorrect: 1, points: 23)
  james.results.create(year: 2015, correct: 10, incorrect: 5, lower_seed_correct: 3, lower_seed_incorrect: 1, points: 14)
  ellery.results.create(year: 2015, correct: 9, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 1, points: 12)
  omar.results.create(year: 2015, correct: 9, incorrect: 6, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 17)
  nathaniel.results.create(year: 2015, correct: 9, incorrect: 6, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 13)
  steven.results.create(year: 2015, correct: 10, incorrect: 5, lower_seed_correct: 2, lower_seed_incorrect: 0, points: 13)
  jay.results.create(year: 2015, correct: 5, incorrect: 10, lower_seed_correct: 0, lower_seed_incorrect: 3, points: 5)
  yuji.results.create(year: 2015, correct: 11, incorrect: 4, lower_seed_correct: 5, lower_seed_incorrect: 2, points: 21)

  sherwin.results.create(year: 2016, correct: 10, incorrect: 5, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 15)
  joey.results.create(year: 2016, correct: 8, incorrect: 7, lower_seed_correct: 2, lower_seed_incorrect: 3, points: 13)
  alex.results.create(year: 2016, correct: 5, incorrect: 10, lower_seed_correct: 1, lower_seed_incorrect: 5, points: 7)
  billy.results.create(year: 2016, correct: 6, incorrect: 9, lower_seed_correct: 2, lower_seed_incorrect: 5, points: 8)
  james.results.create(year: 2016, correct: 11, incorrect: 4, lower_seed_correct: 4, lower_seed_incorrect: 2, points: 18)
  ellery.results.create(year: 2016, correct: 6, incorrect: 9, lower_seed_correct: 2, lower_seed_incorrect: 5, points: 10)
  omar.results.create(year: 2016, correct: 4, incorrect: 11, lower_seed_correct: 3, lower_seed_incorrect: 8, points: 6)
  nathaniel.results.create(year: 2016, correct: 6, incorrect: 9, lower_seed_correct: 1, lower_seed_incorrect: 4, points: 6)
  vinny.results.create(year: 2016, correct: 11, incorrect: 2, lower_seed_correct: 5, lower_seed_incorrect: 1, points: 16)
  jay.results.create(year: 2016, correct: 11, incorrect: 4, lower_seed_correct: 5, lower_seed_incorrect: 3, points: 19)
  yuji.results.create(year: 2016, correct: 9, incorrect: 4, lower_seed_correct: 4, lower_seed_incorrect: 3, points: 11)

  sherwin.results.create(year: 2017, correct: 6, incorrect: 9, lower_seed_correct: 0, lower_seed_incorrect: 4, points: 12)
  joey.results.create(year: 2017, correct: 8, incorrect: 7, lower_seed_correct: 0, lower_seed_incorrect: 2, points: 11)
  billy.results.create(year: 2017, correct: 9, incorrect: 6, lower_seed_correct: 1, lower_seed_incorrect: 2, points: 15)
  james.results.create(year: 2017, correct: 9, incorrect: 6, lower_seed_correct: 1, lower_seed_incorrect: 2, points: 15)
  ellery.results.create(year: 2017, correct: 8, incorrect: 7, lower_seed_correct: 1, lower_seed_incorrect: 3, points: 11)
  omar.results.create(year: 2017, correct: 8, incorrect: 7, lower_seed_correct: 4, lower_seed_incorrect: 6, points: 10)
  nathaniel.results.create(year: 2017, correct: 8, incorrect: 7, lower_seed_correct: 1, lower_seed_incorrect: 3, points: 12)
  jay.results.create(year: 2017, correct: 9, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 3, points: 14)

  sherwin.results.create(year: 2018, correct: 8, incorrect: 7, lower_seed_correct: 3, lower_seed_incorrect: 5, points: 13)
  joey.results.create(year: 2018, correct: 8, incorrect: 7, lower_seed_correct: 0, lower_seed_incorrect: 2, points: 13)
  billy.results.create(year: 2018, correct: 9, incorrect: 6, lower_seed_correct: 2, lower_seed_incorrect: 3, points: 14)
  james.results.create(year: 2018, correct: 7, incorrect: 8, lower_seed_correct: 0, lower_seed_incorrect: 3, points: 10)
  ellery.results.create(year: 2018, correct: 10, incorrect: 5, lower_seed_correct: 3, lower_seed_incorrect: 3, points: 20)
  omar.results.create(year: 2018, correct: 5, incorrect: 9, lower_seed_correct: 2, lower_seed_incorrect: 7, points: 6)
  nathaniel.results.create(year: 2018, correct: 7, incorrect: 8, lower_seed_correct: 2, lower_seed_incorrect: 5, points: 8)
  jay.results.create(year: 2018, correct: 10, incorrect: 5, lower_seed_correct: 2, lower_seed_incorrect: 2, points: 12)
  yuji.results.create(year: 2018, correct: 12, incorrect: 3, lower_seed_correct: 5, lower_seed_incorrect: 3, points: 15)

  sherwin.results.create(year: 2019, correct: 7, incorrect: 8, lower_seed_correct: 5, lower_seed_incorrect: 5, points: 13)
  joey.results.create(year: 2019, correct: 7, incorrect: 8, lower_seed_correct: 1, lower_seed_incorrect: 1, points: 15)
  alex.results.create(year: 2019, correct: 8, incorrect: 7, lower_seed_correct: 3, lower_seed_incorrect: 2, points: 13)
  billy.results.create(year: 2019, correct: 7, incorrect: 8, lower_seed_correct: 0, lower_seed_incorrect: 0, points: 10)
  james.results.create(year: 2019, correct: 5, incorrect: 10, lower_seed_correct: 0, lower_seed_incorrect: 2, points: 7)
  omar.results.create(year: 2019, correct: 7, incorrect: 8, lower_seed_correct: 4, lower_seed_incorrect: 4, points: 9)
  yuji.results.create(year: 2019, correct: 3, incorrect: 12, lower_seed_correct: 2, lower_seed_incorrect: 6, points: 5)

  sherwin.results.create(year: 2020, correct: 11, incorrect: 12, lower_seed_correct: 2, lower_seed_incorrect: 5, points: 13)
  joey.results.create(year: 2020, correct: 11, incorrect: 12, lower_seed_correct: 2, lower_seed_incorrect: 5, points: 16)
  alex.results.create(year: 2020, correct: 14, incorrect: 9, lower_seed_correct: 5, lower_seed_incorrect: 5, points: 23)
  billy.results.create(year: 2020, correct: 12, incorrect: 11, lower_seed_correct: 4, lower_seed_incorrect: 6, points: 22)
  james.results.create(year: 2020, correct: 9, incorrect: 14, lower_seed_correct: 1, lower_seed_incorrect: 6, points: 12)
  omar.results.create(year: 2020, correct: 11, incorrect: 12, lower_seed_correct: 3, lower_seed_incorrect: 6, points: 16)
  yuji.results.create(year: 2020, correct: 11, incorrect: 4, lower_seed_correct: 3, lower_seed_incorrect: 6, points: 19)
  steven.results.create(year: 2020, correct: 12, incorrect: 11, lower_seed_correct: 1, lower_seed_incorrect: 3, points: 22)

  puts "DONE"
end