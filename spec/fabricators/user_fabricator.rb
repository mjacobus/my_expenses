# frozen_string_literal: true

Fabricator(:user, from: 'Db::User') do
  name           'Some Name'
  email          'some@email.com'
  avatar         'https://lh3.googleusercontent.com/-QTW2nlN4-NU/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnAmijxFSFomGTNwgC-PRjxi5qPVg/s96-c/photo.jpgend'
  master         false
  enabled        true
end
