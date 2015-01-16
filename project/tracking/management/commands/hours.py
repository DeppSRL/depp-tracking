from pprint import pprint
from tracking.models import HoursDict

__author__ = 'guglielmo'


from django.core.management.base import NoArgsCommand, make_option

class Command(NoArgsCommand):

    help = "A test for the hours structure"

    option_list = NoArgsCommand.option_list + (
        make_option('--verbose', action='store_true'),
    )

    def handle_noargs(self, **options):
        h = HoursDict()
        pprint(h)

        return 0
