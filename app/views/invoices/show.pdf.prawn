pdf.page.size = 'A4'
#pdf.font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
#pdf.font "/usr/share/fonts/truetype/msttcorefonts/georgia.ttf"
#pdf.font "Times-Roman"
pdf.font "Helvetica"
sender_address = [@invoice.invoicing_party.name, @invoice.invoicing_party.street, "#{@invoice.invoicing_party.post_code} #{@invoice.invoicing_party.city}"]
print_date = @invoice.printed_at.to_s(:german_date)

pdf.bounding_box [pdf.margin_box.left, pdf.margin_box.top - 100], :width => 200 do
  pdf.text(format("%s | %s | %s %s",
      @invoice.invoicing_party.name,
      @invoice.invoicing_party.street,
      @invoice.invoicing_party.post_code,
      @invoice.invoicing_party.city), :size => 6)
  pdf.move_down 15
  pdf.text @invoice.customer.name
  pdf.text @invoice.customer.street
  pdf.move_down 10
  pdf.text "#{@invoice.customer.post_code} #{@invoice.customer.city}", :style => :bold
end

pdf.text_box("#{@invoice.invoicing_party.city}, #{print_date}",
    :at => [pdf.margin_box.left, pdf.cursor + pdf.font_size], :align => :right)

pdf.bounding_box [pdf.margin_box.left, pdf.cursor - 100], :width => pdf.margin_box.width do
  pdf.text "Rechnung", :style => :bold, :size => 24
  pdf.text "Rechnungsnummer: #{@invoice.number}", :size => 14
end

pdf.bounding_box([pdf.margin_box.left, pdf.cursor - 50], :width => pdf.margin_box.width) do
  pdf.text @invoice.covering_text
end

pdf.bounding_box [pdf.margin_box.left, pdf.cursor - 30], :width => pdf.margin_box.width do
  pdf.table([
    ["#{number_with_delimiter(@invoice.hours, :separator => ",")} Stunden gemäss angehängter Leistungsaufstellung",
       number_to_currency(@invoice.amount, :locale => :de)],
    ['zuzüglich der gesetzlichen Mehrwersteuer ',
      number_to_currency(@invoice.vat_amount, :locale => :de)],
    ['Gesamtbetrag ', number_to_currency(@invoice.gross_amount, :locale => :de)]
  ], :align => { 0 => :left, 1 => :right})
end
pdf.bounding_box [pdf.margin_box.left, pdf.cursor - 30], :width => pdf.margin_box.width do
  pdf.text ("Zahlbar bis spätestens #{@invoice.due_on.to_time.to_s(:german_date)} (eingehend)")
end
# footer first page
pdf.bounding_box [pdf.margin_box.left, pdf.margin_box.bottom + 40 ], :width => pdf.margin_box.width do
  pdf.stroke_horizontal_rule
end

pdf.bounding_box([pdf.margin_box.left, pdf.margin_box.bottom + 70], :width => pdf.margin_box.width/3) do
  pdf.indent(50) do
    pdf.text(format("%s\n%s\n%s %s",
      @invoice.invoicing_party.name,
      @invoice.invoicing_party.street,
      @invoice.invoicing_party.post_code,
      @invoice.invoicing_party.city), :size => 7, :align => :left
    )
  end
end

pdf.bounding_box([pdf.margin_box.left + pdf.margin_box.width/3 + 5, pdf.margin_box.bottom + 30], :width => pdf.margin_box.width/3) do
  pdf.text(format("Telefon: %s\nE-Mail: %s\nUstID: %s",
    @invoice.invoicing_party.telephone,
    @invoice.invoicing_party.email,
    @invoice.invoicing_party.vatid), :size => 7, :align => :left
  )
end

pdf.bounding_box([pdf.margin_box.left + 2 * pdf.margin_box.width/3, pdf.margin_box.bottom + 30], :width => pdf.margin_box.width/3) do
  pdf.text(format("Bank: %s\nBLZ: %s\nKonto: %s",
    @invoice.invoicing_party.bank,
    @invoice.invoicing_party.bank_sort_code,
    @invoice.invoicing_party.bank_account_number), :size => 7, :align => :left
  )
end


pdf.start_new_page(:size => "A4", :layout => :landscape)
# header 2nd page
pdf.text_box(
  (sender_address + [@invoice.invoicing_party.telephone, @invoice.invoicing_party.email]).join(' | '),
  :at => [pdf.margin_box.left, pdf.margin_box.top + 15],
  :width => pdf.margin_box.width,
  :size => 8, :align => :right)
pdf.stroke_horizontal_rule

pdf.text_box(
  %Q(Leistungsaufstellung für Rechnung "#{@invoice.number}" vom #{print_date}),
  :at => [pdf.margin_box.left, pdf.margin_box.top - 25],
  :width => pdf.margin_box.width,
  :size => 14, :align => :center, :style => :bold)

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
pdf.move_down 60
pdf.table(
  invoice_items,
  :border_style => :grid,
  :font_size => 6,
  :position => :center,
  :headers => ['Anfang', 'Ende', 'Pausen', 'Stunden', 'Beschreibung', 'Betrag', 'Mwst.-Satz', 'Mwst.', 'Brutto'],
  :align_headers => :center,
  :header_color => 'f0f0f0',
  :align => { 0 => :right, 1 => :right, 2 => :left, 3 => :right, 4 => :left, 5 => :right, 6 => :right, 7 => :right, 8 => :right},
  :row_colors => ["c0ffc0", "ffffff"])
#end


