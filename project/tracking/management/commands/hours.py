from pprint import pprint
import json
import decimal
from ...hoursdict import HoursDict


__author__ = 'guglielmo'


from django.core.management.base import NoArgsCommand, make_option


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return float(o)
        return super(DecimalEncoder, self).default(o)


class Command(NoArgsCommand):
    help = 'A test for the hours structure'

    option_list = NoArgsCommand.option_list + (
        make_option('--verbose', action='store_true'),
    )

    def handle_noargs(self, **options):
        h = HoursDict()
        pprint(json.dumps(h, cls=DecimalEncoder))

        return 0
