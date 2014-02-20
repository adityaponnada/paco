/* Copyright 2013 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#import "PacoScheduleGenerator.h"
#import "PacoExperiment.h"
#import "PacoExperimentSchedule.h"
#import "PacoScheduleGenerator+ESM.h"
#import "PacoScheduleGenerator+Daily.h"
#import "PacoScheduleGenerator+Weekdays.h"

@implementation PacoScheduleGenerator


+ (NSArray*)nextDatesForExperiment:(PacoExperiment*)experiment
                        numOfDates:(NSInteger)numOfDates
                          fromDate:(NSDate*)fromDate {
  PacoExperimentSchedule* schedule = experiment.schedule;
  if (schedule.scheduleType == kPacoScheduleTypeDaily) {
    return [self nextDatesForDailyExperiment:experiment
                                  numOfDates:numOfDates
                                    fromDate:fromDate];
  }
  if (schedule.scheduleType == kPacoScheduleTypeESM) {
    return [self nextDatesForESMExperiment:experiment numOfDates:numOfDates fromDate:fromDate];
  }
  if (schedule.scheduleType == kPacoScheduleTypeWeekday) {
    return [self nextDatesForWeekdaysExperiment:experiment numOfDates:numOfDates fromDate:fromDate];
  }

  //TODO:
  return nil;
}



@end
