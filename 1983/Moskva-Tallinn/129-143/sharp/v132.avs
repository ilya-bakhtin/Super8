import("..\1983-Moskva-Tallinn.avs")

v132 = LSMASHVideoSource(dst_dir + "v132rc.mp4")

v132 = v132.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v132 = v132.convertToYV12(interlaced=false)

v132 = v132.deScratch
v132 = v132.removeDirt

v132 = v132.UnsharpMask(strength=500, radius=5, threshold=1)
v132 = v132.adjustBorders

va = BlankClip(v132, audio_rate = 48000, channels = 2).killVideo
v132 = v132.audioDub(va)

return v132.Prefetch

