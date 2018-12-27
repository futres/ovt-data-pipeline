# -*- coding: utf-8 -*-

"""preprocessor.AbstractPreProcessor implementation for preprocessing vertebrate data"""

# import logging
# import os
import multiprocessing

import os
import uuid
import pandas as pd
from preprocessor import AbstractPreProcessor

# haslength, haslifestage
COLUMNS_MAP = {
        'occurrenceid' : 'occurrence_id',
        'genus' : 'genus',
        'specificepithet' : 'specific_epithet',
        'eventdate' : 'event_date',
        'year' : 'year',
        'decimallatitude' : 'latitude',
        'decimallongitude' : 'longitude',
        'haslength' : 'has_length',
        'lengthtype' : 'length_type',
        'lengthinmm' : 'length_in_mm',
        'lengthunitsinferred' : 'length_units_inferred',
        'hasmass' : 'has_mass',
        'massing' : 'mass_in_g',
        'massunitsinferred' : 'mass_units_inferred'
}

class PreProcessor(AbstractPreProcessor):
    def _process_data(self):
        num_processes = multiprocessing.cpu_count()
        chunk_size = 10000
        data = pd.read_csv(os.path.join(self.input_dir,'vertnet_input.csv'), sep=',', header=0,
                usecols=['recordid','occurrenceid','genus','specificepithet','eventdate',
                'year','decimallatitude','decimallongitude','lengthtype','lengthinmm'],
                engine='python')

        self._transform_data(data).to_csv(self.output_file, columns=self.headers, mode='a', header=False, index=False)

    def _transform_data(self, data):
        data['record_id'] = data.apply(lambda x: uuid.uuid4(), axis=1)
#        data.fillna("", inplace=True)  # replace all null values
        return data.rename(columns=COLUMNS_MAP)


