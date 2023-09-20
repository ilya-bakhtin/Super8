import("..\1983-Moskva-Tallinn.avs")
v46 = LSMASHVideoSource(dst_dir + "v46rc.mp4")

v46 = v46.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v46 = v46.convertToYV12(interlaced=false)

v46 = v46.deScratch
v46 = v46.removeDirt

v46 = v46.UnsharpMask(strength=500, radius=5, threshold=1)
v46 = v46.adjustBorders

va = BlankClip(v46, audio_rate = 48000, channels = 2).killVideo
v46 = v46.audioDub(va)

return v46.Prefetch

