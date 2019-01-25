# -*- coding: utf-8 -*-

"""preprocessor.AbstractPreProcessor implementation for preprocessing vertebrate data"""

# import logging
# import os
#import multiprocessing

import os
import uuid
import pandas as pd
from preprocessor import AbstractPreProcessor

class PreProcessor(AbstractPreProcessor):
    def _process_data(self):
        #num_processes = multiprocessing.cpu_count()
        #chunk_size = 10000
        data = pd.read_csv(os.path.join(self.input_dir,'vertnet_input.csv'), sep=',', header=0,
                #usecols=['recordid','occurrenceid','genus','specificepithet','eventdate',
                #'year','decimallatitude','decimallongitude','lengthtype','lengthinmm'],
                engine='python')

        self._transform_data(data).to_csv(self.output_file, columns=self.headers, mode='a', header=False, index=False)

    def _transform_data(self, data):
        # Apply a unique UUID for every observation and element.  In Vertnet data, we don't track
        # observations or elements so these are just UUIDs in both cases.
        data['observationID'] = data.apply(lambda x: uuid.uuid4(), axis=1)
        data['elementID'] = data.apply(lambda x: uuid.uuid4(), axis=1)
        # fill in empty attributes that are in in self.headers -- we need to have all column names mapped in output
        data['imageURI'] = ''
        data['minimumChronometricAge'] = ''
        data['maximumChronometricAge'] = ''
        data['endDateCertainty']  = ''
        data['associatedSequences'] = ''

        return data


