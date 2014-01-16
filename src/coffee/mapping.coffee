_ = require('underscore')._

class Mapping
  constructor: (options = {}) ->
    @DELIM_HEADER_LANGUAGE = '.'

  map: (rawProducts) ->
    errors = []

    errors

  mapProduct: (rawProduct) ->
    @mapBaseProduct rawProduct.masterVariant

  mapBaseProduct: (rawMaster) ->
    id = null
    version = null

    product =
      id: id
      version: version
      productType:
        type: 'product_type'
        id: productTypeId
      name: name
      slug: slug

  mapLocalizedAttrib: (row, attribName) ->
    values = {}
    if _.has(@lang_h2i, attribName)
      _.each @lang_h2i[attribName], (index, language) ->
        values[language] = row[index]
    # fall back if language columns could not be found
    if _.size(values) is 0
      values[default_language] = row[@h2i[attribName]]
    values

  header2index: (header) ->
    _.object _.map header, (head, index) -> [head, index]

  # "x,a1.de,foo,a1.it"
  # langHeader =
  #   a1:
  #     de: 1
  #     it: 3
  languageHeader2Index: (header, languageAttributes) ->
    lang_h2i = {}
    for langAttribName in languageAttributes
      for head, index in header
        parts = head.split @DELIM_HEADER_LANGUAGE
        if _.size(parts) is 2
          if parts[0] is langAttribName
            lang = parts[1]
            # TODO: check language
            lang_h2i[langAttribName] or= {}
            lang_h2i[langAttribName][lang] = index
    lang_h2i

module.exports = Mapping