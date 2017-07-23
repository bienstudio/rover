import Moment from 'moment';

export default function (time, format = 'D MMM YYYY') {
  if (time === null) {
    return null;
  }

  return moment(time).format(format);
};
