(
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 64;

s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 0;


s.boot;
s.waitForBoot{
	Task({
		1.wait;
		"/home/pat/Documents/SuperCollider/blank.scd".openDocument;
		// ~q = Q(s);

		d = Dictionary.new;
		d.add(\foldernames -> PathName("Documents/SuperCollider/Samples").entries);
		for (0, d[\foldernames].size-1,
			{
				arg i;
				d.add(d[\foldernames][i].folderName.asSymbol -> d[\foldernames][i].entries.collect({
					arg sf;
					Buffer.read(s,sf.fullPath);
				});
		)});
		p = ProxySpace.new(s);
		p.quant_(1);
		StageLimiter.activate;

	}).start;
}
)

