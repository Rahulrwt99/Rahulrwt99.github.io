/// Single source of truth for personal details and outbound links.
///
/// Replace every `REPLACE_WITH_...` value before deploying. The UI treats
/// those values as intentionally unconfigured and disables the relevant CTA.
abstract class PortfolioConfig {
  static const name = 'Rahul Rawat';
  static const role = 'AI/ML Engineer';
  static const location = 'Bilaspur, Chhattisgarh, India';

  static const email = 'rahulrwt7977@gmail.com';
  static const githubUrl = 'https://github.com/Rahulrwt99';
  static const linkedInUrl =
      'https://www.linkedin.com/in/rahul-rawat-00396a1a1';
  static const resumeUrl = 'resume/Rahul_Rawat_Resume.pdf';

  static const vastuAiPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=app.codecrafts.vastuai&pcampaignid=web_share';
  static const astroPanchangPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.rahul.panchang&pcampaignid=web_share';
  static const pdfReaderPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=pdf.pdfreader.pdfviewer.pdfeditor.freepdf&pcampaignid=web_share';

  static bool isConfigured(String value) =>
      value.trim().isNotEmpty && !value.startsWith('REPLACE_WITH_');
}
