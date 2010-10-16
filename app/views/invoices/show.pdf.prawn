pdf.font "Helvetica"
pdf.font_size 18
pdf.text_box "Invoice # #{@invoice.id}", :align => :right

pdf.font_size 22
pdf.text "Thank you for your order, #{@invoice.customer.name}.", :align => :center
pdf.move_down 20

pdf.font_size 14
pdf.text @invoice.invoicing_party.name
pdf.text @invoice.invoicing_party.street
pdf.text @invoice.invoicing_party.post_code
pdf.text @invoice.invoicing_party.city
pdf.text @invoice.invoicing_party.name
pdf.text @invoice.invoicing_party.street
pdf.text @invoice.invoicing_party.post_code
pdf.text @invoice.invoicing_party.city
pdf.text @invoice.contact.name
pdf.text @invoice.contact.street
pdf.text @invoice.contact.post_code
pdf.text @invoice.contact.city
pdf.text @invoice.invoicing_party.city
pdf.text @invoice.printed_at.to_s(:german_date)
pdf.text @invoice.number
pdf.text number_with_delimiter(@invoice.hours, :separator => ",")
pdf.text number_to_currency(@invoice.amount, :locale => :de)
pdf.text  number_to_currency(@invoice.vat_amount, :locale => :de)
pdf.text number_to_currency(@invoice.gross_amount, :locale => :de)

pdf.start_new_page
invoice_items = @invoice.service_invoice_items.map do |invoice_item|
      [
        invoice_item.started_at.to_s(:medium),
        invoice_item.ended_at.to_s(:medium),
        invoice_item.pause_times,
        number_with_delimiter(invoice_item.hours, :separator => ","),
        invoice_item.description,
        number_to_currency(invoice_item.amount, :locale => :de),
        number_with_delimiter(invoice_item.vat_rate * 100, :separator => ","),
        number_to_currency(invoice_item.vat_amount, :locale => :de),
        number_to_currency(invoice_item.gross_amount, :locale => :de)
      ]
    end
pdf.rotate(90, :origin => [250, 450]) do
pdf.table(
    invoice_items + invoice_items + invoice_items,
    :border_style => :grid,
    :font_size => 8,
    :position => :left,
# :column_widths => { 0 => 15, 1 => 25},
    :headers => ['Anfang', 'Ende', 'Pausen', 'Stunden', 'Beschreibung', 'Betrag', 'Mwst.-Satz', 'Mwst.', 'Brutto'],
    :align_headers => :center,
    :align => { 0 => :right, 1 => :right, 2 => :right, 3 => :right, 4 => :right, 5 => :right, 6 => :right, 7 => :right, 8 => :right},
    :row_colors => ["c0ffc0", "ffffff"])
end


