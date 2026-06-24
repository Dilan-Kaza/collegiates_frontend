export default function OfficialRules() {
  return (
    <div className="space-y-4">
      <p className="text-gray-700">This page compiles all rule sets utilized by the National Collegiate Wushu Tournament for easier viewing.</p>
      <div className="space-y-3">
        <div className="border-l-4 border-l-secondary border border-gray-200 rounded-lg p-4">
          <h3 className="font-semibold text-primary">Collegiate Wushu Tournament Rules</h3>
          <p className="text-gray-600 mt-1">Tournament-specific rules outlining competitor eligibility, experience level requirements, team competition rules, all-around champion rules, and group set rules.</p>
        </div>
        <div className="border-l-4 border-l-secondary border border-gray-200 rounded-lg p-4">
          <h3 className="font-semibold text-primary">United States Wushu Union (USWU) Rules</h3>
          <p className="text-gray-600 mt-1">All individual events are judged using USWU 2002 rules and 2004 rules addendum unless otherwise specified (e.g. nandu events).</p>
        </div>
        <div className="border-l-4 border-l-secondary border border-gray-200 rounded-lg p-4">
          <h3 className="font-semibold text-primary">International Wushu Federation (IWUF) Rules</h3>
          <p className="text-gray-600 mt-1">IWUF rules are used ONLY for the three nandu events: nandu changquan, nandu nanquan, and nandu taijiquan.</p>
        </div>
      </div>
    </div>
  );
}
