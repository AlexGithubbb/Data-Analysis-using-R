#Exercise 2: Since the variable names are too complicated, we change them into brief ones: nums, 
#speeding, alcohol, not_distracted, first_collision and insurance_company_loses
bad_drivers_brief <- bad_drivers %>% select(State, 
                                            nums= Number.of.drivers.involved.in.fatal.collisions.per.billion.miles,
                                            speeding = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Speeding,
                                            alcohol = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Alcohol.Impaired,
                                            not_distracted = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Were.Not.Distracted,
                                            first_collision = Percentage.Of.Drivers.Involved.In.Fatal.Collisions.Who.Had.Not.Been.Involved.In.Any.Previous.Accidents,
                                            car_insurance = Car.Insurance.Premiums....,
                                            insur_comp_loses = Losses.incurred.by.insurance.companies.for.collisions.per.insured.driver.... )
# list the updated variable names
colnames(bad_drivers_brief)
# list the first 9 rows of updated dataset
head(bad_drivers_brief,9)